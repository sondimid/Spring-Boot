package com.javaweb.entity;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;

@Entity
@Table(name = "assignmentbuilding")
public class AssignmentBuildingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "staffid")
    private Integer staffId;

    @Column(name = "buildingid")
    private Integer buildingId;

    @ManyToOne
    @JoinColumn(name = "buildingid", insertable = false, updatable = false)
    BuildingEntity buildingEntity = new BuildingEntity();

    @ManyToOne
    @JoinColumn(name = "staffid", insertable = false, updatable = false)
    UserEntity staffs = new UserEntity();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BuildingEntity getBuildingEntity() {
        return buildingEntity;
    }

    public void setBuildingEntity(BuildingEntity buildingEntity) {
        this.buildingEntity = buildingEntity;
    }


    public UserEntity getStaffs() {
        return staffs;
    }

    public void setStaffs(UserEntity staffs) {
        this.staffs = staffs;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public Integer getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Integer buildingId) {
        this.buildingId = buildingId;
    }
}
