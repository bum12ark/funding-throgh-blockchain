<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("pMap");
	Gson gson = new Gson();
	Map<String, List> rootMap = new HashMap<>();
	List<Map<String, Object>> colsList = new Vector<Map<String,Object>>();
	// cols
	Map<String, Object> colsMap = new HashMap<String, Object>();
	// 1
	colsMap.put("id", "");
	colsMap.put("labels", "연령대");
	colsMap.put("pattern", "");
	colsMap.put("type", "string");
	colsList.add(colsMap);
	// 2
	colsMap = new HashMap<String, Object>();
	colsMap.put("id", "");
	colsMap.put("labels", "명수");
	colsMap.put("pattern", "");
	colsMap.put("type", "number");
	colsList.add(colsMap);
	
	rootMap.put("cols", colsList);
	
	// rows
	List<Map<String, Object>> rowsList = new Vector<Map<String,Object>>();
	Map<String, Object> rowsMap = new HashMap<String, Object>();
	List<Map<String, Object>> detailRowList = new Vector<Map<String,Object>>();
	Map<String, Object> detailRowMap = new HashMap<String, Object>();
	if(Integer.parseInt(rMap.get("10대").toString())>0){
	detailRowMap.put("v", "10대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", rMap.get("10대"));
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	}
	if(Integer.parseInt(rMap.get("20대").toString())>0){
	detailRowMap = new HashMap<String, Object>();
	detailRowList = new Vector<>();
	detailRowMap.put("v", "20대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", rMap.get("20대"));
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap = new HashMap<>();
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	}
	if(Integer.parseInt(rMap.get("30대").toString())>0){
	detailRowMap = new HashMap<String, Object>();
	detailRowList = new Vector<>();
	detailRowMap.put("v", "30대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", rMap.get("30대"));
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap = new HashMap<>();
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	}
	if(Integer.parseInt(rMap.get("40대").toString())>0){
	detailRowMap = new HashMap<String, Object>();
	detailRowList = new Vector<>();
	detailRowMap.put("v", "40대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", rMap.get("40대"));
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap = new HashMap<>();
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	}
	if(Integer.parseInt(rMap.get("50대").toString())>0){
	detailRowMap = new HashMap<String, Object>();
	detailRowList = new Vector<>();
	detailRowMap.put("v", "50대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", rMap.get("50대"));
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap = new HashMap<>();
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	}
	
	rootMap.put("rows", rowsList);
	
	String data = gson.toJson(rootMap);
	out.print(data);
%>