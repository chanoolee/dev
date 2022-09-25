package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Platform;

public interface HomeService {
	
	public List<Platform> netflexList() throws Exception;
	public List<Platform> coupangList() throws Exception;
	public List<Platform> waveList() throws Exception;
	public List<Platform> watchaList() throws Exception;
	public List<Platform> disneyList() throws Exception;
	public List<Platform> tivingList() throws Exception;
}
