package com.community;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityLogic {
	private static final Logger logger = LoggerFactory.getLogger(CommunityLogic.class);
	
	@Autowired
	CommunityDao communityDao = null;
	
}
