package com.partInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.PartInfoMapper;
import com.vo.CarInfo;
import com.vo.PartInfo;

@Repository("partInfoDao")
public class PartInfoDao {
	
	@Autowired
	PartInfoMapper mapper;
	
	public PartInfo select(String s) {
		// TODO Auto-generated method stub
		return mapper.select(s);
	}
	public List<PartInfo> listAll(){
		return mapper.selectAll();
	}

	

	


}
