package com.javaweb.utils;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;

import java.util.List;

public class ExistingUtils {
    public static boolean check(Integer buildingId, Integer staffId, List<AssignmentBuildingEntity> assignmentBuildingEntities) {
        for (AssignmentBuildingEntity assignmentBuildingEntity : assignmentBuildingEntities) {
            if(assignmentBuildingEntity.getBuildingId() == buildingId && assignmentBuildingEntity.getStaffId() == staffId) return true;
        }
        return false;
    }
}
