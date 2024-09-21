package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    public void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        Integer staffId = buildingSearchBuilder.getStaffId();
        Integer rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
        Integer rentAreaTo = buildingSearchBuilder.getRentAreaTo();

        if (staffId != null) {
            sql.append(" JOIN assignmentbuilding a ON b.id = a.buildingid ");
        }

        if (rentAreaFrom != null || rentAreaTo != null) {
            sql.append(" JOIN rentarea ra ON b.id = ra.buildingid ");
        }

    }
    public void queryNormal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        sql.append(" WHERE 1 = 1 ");
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for (Field field : fields) {

                field.setAccessible(true);
                String fieldName = field.getName();

                if (!fieldName.equals("staffId")&& !fieldName.startsWith("rent") && !fieldName.startsWith("area")
                    && !fieldName.equals("type")) {
                    Object value = field.get(buildingSearchBuilder);
                    if(value != null) {
                        String valueString = value.toString();
                        if (NumberUtils.isLong(valueString)) {
                            sql.append(" AND b." + fieldName.toLowerCase() + " = " + value);
                        } else if (StringUtils.check(valueString)) {
                            sql.append(" AND b." + fieldName.toLowerCase() + " LIKE '%" + value + "%' ");
                        }
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @PersistenceContext
    private EntityManager entityManager;

    public void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {

        Integer staffId = buildingSearchBuilder.getStaffId();
        Integer rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
        Integer rentAreaTo = buildingSearchBuilder.getRentAreaTo();
        Integer rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Integer rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        List<String> type = buildingSearchBuilder.getType();

        if (staffId != null) {
            sql.append(" AND a.staffid = " + staffId.toString());
        }

        if (rentAreaFrom != null) {
            sql.append(" AND ra.value >= " + rentAreaFrom.toString());
        }

        if (rentAreaTo != null) {
            sql.append(" AND ra.value <= " + rentAreaTo.toString());
        }

        if (rentPriceFrom != null) {
            sql.append(" AND b.rentprice >= " + rentPriceFrom.toString());
        }

        if (rentPriceTo != null) {
            sql.append(" AND b.rentprice <= " + rentPriceTo.toString());
        }

        if(type!=null && !type.isEmpty()) {
            sql.append(" AND( ");
            String tmp = type.stream().map(it -> "b.type LIKE '%" + it + "%'").collect(Collectors.joining(" OR "));
            sql.append(tmp + " ) ");
        }
        sql.append(" GROUP BY b.id ");
    }

    public void pagination(StringBuilder sql, Pageable pageable){
        sql.append(" LIMIT " + pageable.getPageSize() + " OFFSET " + pageable.getOffset());
    }

    @Override
    public List<BuildingEntity> findByBuildingSearchBuilder(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");
        joinTable(buildingSearchBuilder, sql);
        queryNormal(buildingSearchBuilder, sql);
        querySpecial(buildingSearchBuilder, sql);
        pagination(sql, pageable);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");
        joinTable(buildingSearchBuilder, sql);
        queryNormal(buildingSearchBuilder, sql);
        querySpecial(buildingSearchBuilder, sql);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }


}
