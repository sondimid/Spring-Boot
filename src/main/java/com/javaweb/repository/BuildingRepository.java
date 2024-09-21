package com.javaweb.repository;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;


public interface BuildingRepository extends JpaRepository<BuildingEntity, Integer>, BuildingRepositoryCustom, PagingAndSortingRepository<BuildingEntity, Integer> {
    List<BuildingEntity> findByBuildingSearchBuilder(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);
    void deleteByIdIn(List<Integer> ids);
}
