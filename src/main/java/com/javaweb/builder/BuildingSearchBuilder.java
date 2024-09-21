package com.javaweb.builder;

import java.util.ArrayList;
import java.util.List;

public class BuildingSearchBuilder {
    private String name, street, ward, managerName, managerPhone, district;
    private Integer numberOfBasement, floorArea, rentPriceFrom, rentPriceTo, rentAreaFrom, rentAreaTo, staffId,
            serviceFee, brokerageFee;
    private List<String> type;

    private BuildingSearchBuilder(Builder builder) {
        this.name = builder.name;
        this.street = builder.street;
        this.ward = builder.ward;
        this.managerName = builder.managerName;
        this.managerPhone= builder.managerPhone;
        this.numberOfBasement = builder.numberOfBasement;
        this.floorArea = builder.floorArea;
        this.rentPriceFrom = builder.rentPriceFrom;
        this.rentPriceTo = builder.rentPriceTo;
        this.district = builder.district;
        this.type = builder.type;
        this.rentAreaFrom = builder.rentAreaFrom;
        this.rentAreaTo = builder.rentAreaTo;
        this.staffId = builder.staffId;
    }

    public List<String> getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public String getStreet() {
        return street;
    }

    public String getWard() {
        return ward;
    }

    public String getManagerName() {
        return managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public Integer getRentPriceFrom() {
        return rentPriceFrom;
    }

    public Integer getRentPriceTo() {
        return rentPriceTo;
    }

    public Integer getRentAreaFrom() {
        return rentAreaFrom;
    }

    public Integer getRentAreaTo() {
        return rentAreaTo;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public Integer getFloorArea() {
        return floorArea;
    }


    public Integer getServiceFee() {
        return serviceFee;
    }

    public Integer getBrokerageFee() {
        return brokerageFee;
    }

    public String getDistrict() {
        return district;
    }

    public static class Builder {
        private String name, street, ward, managerName, managerPhone, district;
        private Integer numberOfBasement, floorArea, rentPriceFrom, rentPriceTo, rentAreaFrom, rentAreaTo, staffId;
        private List<String> type;

        public Builder setDistrict(String district) {
            this.district = district;
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setStreet(String street) {
            this.street = street;
            return this;
        }

        public Builder setWard(String ward) {
            this.ward = ward;
            return this;
        }

        public Builder setManagerName(String managerName) {
            this.managerName = managerName;
            return this;
        }

        public Builder setManagerPhone(String managerPhone) {
            this.managerPhone = managerPhone;
            return this;
        }

        public Builder setNumberOfBasement(Integer numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public Builder setFloorArea(Integer floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public Builder setRentPriceFrom(Integer rentPriceFrom) {
            this.rentPriceFrom = rentPriceFrom;
            return this;
        }

        public Builder setRentAreaFrom(Integer rentAreaFrom) {
            this.rentAreaFrom = rentAreaFrom;
            return this;
        }

        public Builder setRentAreaTo(Integer rentAreaTo) {
            this.rentAreaTo = rentAreaTo;
            return this;
        }

        public Builder setStaffId(Integer staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder setRentPriceTo(Integer rentPriceTo) {
            this.rentPriceTo = rentPriceTo;
            return this;
        }

        public Builder setType(List<String> type) {
            this.type = type;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }
}