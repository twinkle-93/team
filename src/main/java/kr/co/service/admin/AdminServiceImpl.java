package kr.co.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.admin.AdminDAO;
import kr.co.dto.AdminVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO aDao;

	@Override
	public AdminVO login(AdminVO vo) {
		return aDao.login(vo);
	}
}