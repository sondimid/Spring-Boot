package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface IBuildingService {
    ResponseDTO listType(Integer id);
    ResponseDTO listStaffs(Integer id);
    void addOrUpdateBuilding(BuildingDTO buildingDTO);
    BuildingDTO findById(Integer id);
    void deleteByIdIn(List<Integer> ids);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Integer page, Integer size);
    Integer getSize(BuildingSearchRequest buildingSearchRequest);
}
