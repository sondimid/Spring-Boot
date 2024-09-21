package com.javaweb.utils;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GetSizePage {

    @Autowired
    private IBuildingService buildingService;

    public Integer get(BuildingSearchRequest buildingSearchRequest) {

        return (int) Math.ceil((double)(buildingService.getSize(buildingSearchRequest) / buildingSearchRequest.getMaxPageItems()));
    }
}
