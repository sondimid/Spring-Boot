package com.javaweb.enums;

import java.util.TreeMap;

public enum buildingType {
    TANG_TRET ("Tầng Trệt "),
    NGUYEN_CAN ("Nguyên Căn "),
    NOI_THAT ("Nội Thất ");

    private final String name;

    buildingType(String name) {
        this.name = name;
    }

    public String getCode() {
        return name;
    }

    public static TreeMap<String,String> type(){
        TreeMap<String,String> listType = new TreeMap<>();
        for(buildingType item : buildingType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
