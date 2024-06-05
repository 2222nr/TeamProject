package kr.co.wecky.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.wecky.dto.AdminDto;
import kr.co.wecky.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired
	AdminMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	public int adminInsert(AdminDto adminDto) {
		adminDto.setA_password(passwordEncoder.encode(adminDto.getA_password()));
		if(adminDto.getA_id().equals("admin")) {
			adminDto.setA_approval(1);
		}
		
		return mapper.adminInsert(adminDto);
	}
	
	
	public AdminDto loginConfirm(AdminDto adminDto) {
		AdminDto dto = new AdminDto();
		dto = mapper.loginConfirm(adminDto);
		return dto;
	}


	public List<AdminDto> adminList() {
		return mapper.adminList();
	}

}
