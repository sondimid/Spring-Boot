package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.converter.ConvertBuildingSearchResponse;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    BuildingDTOConverter buildingDTOConverter;

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private ConvertBuildingSearchResponse convertBuildingSearchResponse;

    @Override
    public ResponseDTO listStaffs(Integer id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        List<AssignmentBuildingEntity> assignmentBuildingEntities = buildingEntity.getAssignmentBuildingEntities();
        for (AssignmentBuildingEntity assignmentBuildingEntity : assignmentBuildingEntities) {
            staffAssignment.add(assignmentBuildingEntity.getStaffs());
        }
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        for (UserEntity userEntity : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(Integer.parseInt(userEntity.getId().toString()));
            staffResponseDTO.setFullName(userEntity.getFullName());
            if (staffAssignment.contains(userEntity)) {
                staffResponseDTO.setChecked("checked");
            } else staffResponseDTO.setChecked("");
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        return responseDTO;
    }

    @Override
    public ResponseDTO listType(Integer id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        ResponseDTO responseDTO = new ResponseDTO();
        return null;
    }

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    RentAreaRepository rentAreaRepository;

    @Override
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setType(buildingDTO.getType().stream().map(it -> it).collect(Collectors.joining(", ")));
        buildingRepository.save(buildingEntity);
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        String[] values = buildingDTO.getRentArea().split(",");
        for (String value : values) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setBuildingId(buildingEntity.getId());
            rentAreaEntity.setBuildingEntity(buildingEntity);
            rentAreaEntity.setValue(Integer.parseInt(value));
            rentAreaEntities.add(rentAreaEntity);

        }
        List<RentAreaEntity> existingRentAreaEntities = rentAreaRepository.findByBuildingId(buildingEntity.getId());
        rentAreaRepository.deleteAll(existingRentAreaEntities);
        rentAreaRepository.saveAll(rentAreaEntities);
    }


    @Override
    public BuildingDTO findById(Integer id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingDTOConverter.toBuildingDto(buildingEntity);
        return buildingDTO;
    }

    @Override
    public void deleteByIdIn(List<Integer> ids) {
        for (Integer id : ids) {
            List<AssignmentBuildingEntity> assignmentBuildingEntity = assignmentBuildingRepository.findByBuildingId(id);
            assignmentBuildingRepository.deleteAll(assignmentBuildingEntity);
            List<RentAreaEntity> rentAreaEntities = rentAreaRepository.findByBuildingId(id);
            rentAreaRepository.deleteAll(rentAreaEntities);
            buildingRepository.deleteById(id);
        }
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page - 1, size);
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);

        List<BuildingEntity> buildingEntities = buildingRepository.findByBuildingSearchBuilder(buildingSearchBuilder, pageable);

        List<BuildingSearchResponse> buildingSearchResponses = buildingEntities.stream()
                .map(buildingEntity -> convertBuildingSearchResponse.toBuildingSearchResponse(buildingEntity))
                .collect(Collectors.toList());

        return buildingSearchResponses;
    }

    @Override
    public Integer getSize(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        return buildingEntities.size();
    }
}
