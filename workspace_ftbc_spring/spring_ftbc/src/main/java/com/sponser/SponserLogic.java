package com.sponser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SponserLogic {
	private static final Logger logger = LoggerFactory.getLogger(SponserLogic.class);
	
	@Autowired
	SponserDao sponserDao = null;
			
}
