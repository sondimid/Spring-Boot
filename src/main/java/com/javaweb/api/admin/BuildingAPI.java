package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.impl.AssignmentBuildingService;
import com.javaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        buildingService.addOrUpdateBuilding(buildingDTO);
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Integer> ids){
        buildingService.deleteByIdIn(ids);
    }

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;
    @PostMapping("/assignmentBuilding")
    public void assignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
       assignmentBuildingService.assignmentBuilding(assignmentBuildingDTO);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Integer id){
        ResponseDTO responseDTO = buildingService.listStaffs(id);
        return responseDTO;
    }
}
