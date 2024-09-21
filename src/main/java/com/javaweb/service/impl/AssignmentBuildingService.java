package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentBuildingService implements IAssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void assignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findByBuildingId(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingRepository.deleteAll(assignmentBuildingEntities);
        for (Integer staffId : assignmentBuildingDTO.getStaffIds()) {

            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
            assignmentBuildingEntity.setBuildingId(assignmentBuildingDTO.getBuildingId());
            assignmentBuildingEntity.setStaffId(staffId);
            assignmentBuildingEntity.setBuildingEntity(buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get());
            assignmentBuildingEntity.setStaffs(userRepository.findById(Long.valueOf(staffId)).get());
            assignmentBuildingRepository.save(assignmentBuildingEntity);
        }
    }
}
