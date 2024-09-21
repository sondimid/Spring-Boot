package com.javaweb.controller.admin;


import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.GetSizePage;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Null;
import java.util.List;


@RestController(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private IUserService userService;

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private GetSizePage getSizePage;

    @GetMapping(value = "/admin/building-search")
    public ModelAndView buildingSearch(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/search");

        mav.addObject("totalPages", getSizePage.get(buildingSearchRequest));
        mav.addObject("currentPage", buildingSearchRequest.getPage());
        mav.addObject("buildingResponses", buildingService.findAll(buildingSearchRequest, buildingSearchRequest.getPage(), buildingSearchRequest.getMaxPageItems()));
        mav.addObject("buildingSearch", buildingSearchRequest);
        mav.addObject("districts", districtCode.type());
        mav.addObject("type", buildingType.type());
        mav.addObject("listStaffs", userService.listStaffs());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingAdd(@ModelAttribute BuildingDTO buildingDTO ,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("type", buildingType.type());
        mav.addObject("districts", districtCode.type());
        mav.addObject("listStaffs", userService.listStaffs());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingAdd(@PathVariable("id") Integer id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.findById(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("type", buildingType.type());
        mav.addObject("districts", districtCode.type());
        mav.addObject("listStaffs", userService.listStaffs());
        return mav;
    }
}
