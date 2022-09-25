package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Platform;

public interface HomeMapper {
	
	public List<Platform> netflexList() throws Exception;
	public List<Platform> coupangList() throws Exception;
	public List<Platform> waveList() throws Exception;
	public List<Platform> watchaList() throws Exception;
	public List<Platform> disneyList() throws Exception;
	public List<Platform> tivingList() throws Exception;

}
