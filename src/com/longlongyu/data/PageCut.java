package com.longlongyu.data;

import java.util.List;

import com.longlongyu.Info.PostInfo;

public class PageCut {
	private int pageSize;    // 每页的条数
	private int currPageNum; // 当前页
	private int maxViewPagesNum = 4; // 当前页外最大的显示页数
	
	private List<PostInfo> dataList;    // 存放数据的列表
	public PageCut(List<PostInfo> list, int currPageNum, int pageSize) {
		this.currPageNum = currPageNum <= 0 ? 1 : currPageNum;
		this.pageSize = pageSize <= 0 ? 10 : pageSize;
		setDataList(list);
	}
	
	public PageCut(List<PostInfo> list, int currPageNum, int pageSize, int maxViewPagesNum) {
		this.maxViewPagesNum = maxViewPagesNum <= 0 ? 4 : maxViewPagesNum;
		this.currPageNum = currPageNum <= 0 ? 1 : currPageNum;
		this.pageSize = pageSize <= 0 ? 10 : pageSize;
		setDataList(list);
	}
	
	public List<?> getDataList() {
		return dataList;
	}
	
	public void setDataList(List<PostInfo> list) {
		this.dataList = list;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getCurrPageNum() {
		return currPageNum;
	}
	
	public void setCurrPageNum(int currPageNum) {
		this.currPageNum = currPageNum;
	}
	
	public int getStartPageNum() {
		int result = currPageNum - (maxViewPagesNum / 2) > 1 ? currPageNum - (maxViewPagesNum / 2) : 1;
		while (result + maxViewPagesNum > getTotalPages() && result > 1) {
			result--;
		}
		return result ;
	}
	
	public int getEndPageNum() {
		int end = getStartPageNum() + maxViewPagesNum;
		return end > getTotalPages() ? getTotalPages() : end;
	}
	
	public int getTotalNumber() {
		return dataList.size();
	}
	
	public int getTotalPages() {
		return (int) Math.ceil((float)getTotalNumber() / (float)pageSize);
	}
	
	public List<PostInfo> getCurrPageList() {
		int n = currPageNum * pageSize;
		int num = n < getTotalNumber() ? n : getTotalNumber() - 1;
		List<PostInfo> result = dataList.subList((currPageNum - 1) * pageSize, num);
		return result;
	}
	
}
