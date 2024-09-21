package com.javaweb.converter;


import java.util.ArrayList;
import java.util.Map;

import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.utils.MapUtils;

@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(buildingSearchRequest.getName(), String.class))
                .setFloorArea(MapUtils.getObject(buildingSearchRequest.getFloorArea(), Integer.class))
                .setManagerName(MapUtils.getObject(buildingSearchRequest.getManagerName(), String.class))
                .setManagerPhone(MapUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class))
                .setNumberOfBasement(MapUtils.getObject(buildingSearchRequest.getNumberOfBasement(), Integer.class))
                .setRentPriceFrom(MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Integer.class))
                .setRentPriceTo(MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Integer.class))
                .setRentAreaFrom(MapUtils.getObject(buildingSearchRequest.getRentAreaFrom(), Integer.class))
                .setRentAreaTo(MapUtils.getObject(buildingSearchRequest.getRentAreaTo(), Integer.class))
                .setStaffId(MapUtils.getObject(buildingSearchRequest.getStaffId(), Integer.class))
                .setStreet(MapUtils.getObject(buildingSearchRequest.getStreet(), String.class))
                .setWard(MapUtils.getObject(buildingSearchRequest.getWard(), String.class))
                .setType(buildingSearchRequest.getTypeCode())
                .setDistrict(MapUtils.getObject(buildingSearchRequest.getDistrict(), String.class)).build();
        return buildingSearchBuilder;
    }
}