package com.project.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


import vo.ProjectVO;

public class SortProject {

	//인원수 많은 순으로 정렬후 10개만 담음.
	public List<ProjectVO> SortbySupNum(List<ProjectVO> pList){
		List<ProjectVO> rList = new ArrayList<>();
		System.out.println("0번째"+pList.get(0));
		Collections.sort(pList,new CompareNumDesc());
	        for (int i=0; i<pList.size(); i++) {
	        	ProjectVO pVO = pList.get(i);
	            System.out.println(pVO.toString());          
	            rList.add(pVO);
	      }
		return rList;
	}
	public List<ProjectVO> SortbyOut(List<ProjectVO> pList){
		List<ProjectVO> rList = new ArrayList<>();
		System.out.println("0번째"+pList.get(0));
		Collections.sort(pList,new CompareOutlineAsc());
		for (int i=0; i<pList.size(); i++) {
			ProjectVO pVO = pList.get(i);
			System.out.println(pVO.toString());          
			rList.add(pVO);
		}
		return rList;
	}
	public List<ProjectVO> SortbySuccess(List<ProjectVO> pList){
		List<ProjectVO> rList = new ArrayList<>();
		System.out.println("0번째"+pList.get(0));
		Collections.sort(pList,new CompareSuccessAsc());
		for (int i=0; i<pList.size(); i++) {
			ProjectVO pVO = pList.get(i);
			System.out.println(pVO.toString());          
			rList.add(pVO);
		}
		return rList;
	}
	
	// 후원자 수 내림차순
	class CompareNumDesc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			return pVO1.getSupport_num() > pVO2.getSupport_num() ? -1
					: pVO1.getSupport_num() < pVO2.getSupport_num() ? 1 : 0;
		}
	}

	//후원자 수 오름차순
	class CompareNumAsc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getSupport_num() < pVO2.getSupport_num() ? -1
					: pVO1.getSupport_num() > pVO2.getSupport_num() ? 1 : 0;
		}
	}

	//펀딩 금액 내림차순
	class CompareMoneyDesc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getFundedMoney() > pVO2.getFundedMoney() ? -1
					: pVO1.getFundedMoney() < pVO2.getFundedMoney() ? 1 : 0;
		}
	}

	//펀딩 금액 오름차순
	class CompareMoneyAsc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getFundedMoney() < pVO2.getFundedMoney() ? -1
					: pVO1.getFundedMoney() > pVO2.getFundedMoney() ? 1 : 0;
		}
	}
	
	//남은기간 금액 오름차순
	class CompareOutlineAsc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getOutLine() < pVO2.getOutLine() ? -1
					: pVO1.getOutLine() > pVO2.getOutLine() ? 1 : 0;
		}
	}
	//남은 금액 오름차순
	class CompareSuccessAsc implements Comparator<ProjectVO> {
		
		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getSuccessMoney() > pVO2.getSuccessMoney() ? -1
					: pVO1.getSuccessMoney() < pVO2.getSuccessMoney() ? 1 : 0;
		}
	}

}
