package project.admin.e_p001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.admin.e_p001.dao.E_p001DAO;
import project.admin.e_p001.vo.E_p001VO;

@Service
//@Transactional(propagation = Propagation.REQUIRED)
public class E_p001ServiceImpl implements E_p001Service{
	
	@Autowired
	private E_p001DAO e_p001DAO;

	@Override //회원등록
	public int addUser(E_p001VO e_p001VO) throws Exception {
		return e_p001DAO.addUser(e_p001VO);
	}

	@Override //회원 조건검색
	public List userSearch(Map<String, String> search) throws Exception {
		 List userList = e_p001DAO.selectUser(search);
		return userList;
	}

	@Override //회원 삭제
	public int removeUser(String userId) throws Exception {
		return e_p001DAO.deleteUser(userId);
	}

	@Override // 수정정 회원정보 출력 매소드
	public List upDateUserList(String userId) throws Exception {
		List upDeteUser = e_p001DAO.selectUpdateUserList(userId);
		return upDeteUser;
	}

	@Override //회원 정보 수정 메소드
	public int upDateUser(E_p001VO e_p001VO) throws Exception {
		return e_p001DAO.upDaet(e_p001VO);
	}



}
