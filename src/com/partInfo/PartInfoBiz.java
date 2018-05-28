package com.partInfo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vo.PartInfo;

@Service("partInfoBiz")
public class PartInfoBiz {

	@Inject
	private PartInfoDao dao;
	
	public PartInfo get(String s) {
		// TODO Auto-generated method stub
		return dao.select(s);
	}

	public List<PartInfo> listAll(){
		return dao.listAll();
	}

}
