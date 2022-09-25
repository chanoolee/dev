package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Platform;
import org.hdcd.mapper.HomeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class HomeServiceImpl implements HomeService {

	private final HomeMapper mapper;
	
	@Override
	public List<Platform> netflexList() throws Exception {
		return mapper.netflexList();
	}

	@Override
	public List<Platform> coupangList() throws Exception {
		return mapper.coupangList();
	}

	@Override
	public List<Platform> waveList() throws Exception {
		return mapper.waveList();
	}

	@Override
	public List<Platform> watchaList() throws Exception {
		return mapper.watchaList();
	}

	@Override
	public List<Platform> disneyList() throws Exception {
		return mapper.disneyList();
	}

	@Override
	public List<Platform> tivingList() throws Exception {
		return mapper.tivingList();
	}

}
