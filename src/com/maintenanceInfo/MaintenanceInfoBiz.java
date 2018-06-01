package com.maintenanceInfo;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.partInfo.PartInfoDao;
import com.vo.MaintenanceInfo;
import com.vo.PartInfo;

@Service("maintenanceInfoBiz")
public class MaintenanceInfoBiz {

	@Inject
	private MaintenanceInfoDao dao;
	
	@Inject 
	private PartInfoDao pdao;
	
	@Transactional
	public void register(String car_num) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		List<PartInfo>plist=pdao.listAll();
		for(int  i=0;i<plist.size();i++) {
			
			System.out.println(plist.get(i).getPart_name());
			map.put("car_num", car_num);
			map.put("part_id", plist.get(i).getPart_id());
			dao.insert(map);
			
		}
		
	
	}

	
	public void remove(String s) {
		// TODO Auto-generated method stub
		dao.delete(s);
	}


	public void modify(MaintenanceInfo c) {
		// TODO Auto-generated method stub
		dao.update(c);
	}
	public void modifyST(MaintenanceInfo c) {
		// TODO Auto-generated method stub
		dao.updateST(c);
	}
	
	public MaintenanceInfo get(String s) {
		// TODO Auto-generated method stub
		return dao.select(s);
	}

	public List<MaintenanceInfo> listCarAll(String car_num){
		return dao.listCar(car_num);
	}

	public List<MaintenanceInfo> listStAll(String car_num){
		return dao.listSt(car_num);
	}
	public List<MaintenanceInfo> listSupply(String car_num){
		return dao.listSp(car_num);
	}
}
