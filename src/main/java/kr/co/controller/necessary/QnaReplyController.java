package kr.co.controller.necessary;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.service.qnareply.QnaReplyService;


@RestController
@RequestMapping("/qnareplies")
public class QnaReplyController {

	@Inject
	private QnaReplyService qrService;
	
	// insert.POST
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public void insert() {
		
	}
	
	// list.GET
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public void list() {
		
	}
	
	// update.PUT
	@RequestMapping(value = "/reply", method = RequestMethod.PUT)
	public void update() {
		
	}
	
	// delete.GET
	@RequestMapping(value = "/reply", method = RequestMethod.DELETE)
	public void delete() {
		
	}
	
	
}
