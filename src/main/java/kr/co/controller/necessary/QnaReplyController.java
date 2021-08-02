package kr.co.controller.necessary;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.dto.QnaReplyDTO;
import kr.co.service.qnareply.QnaReplyService;

@RestController
@RequestMapping("/qnareplies")
public class QnaReplyController {

	@Inject
	private QnaReplyService qrService;

	// insert.POST
	@RequestMapping(value = "/reply", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public String insert(@RequestBody Map<String,Object> map) {
		
		int qna_about_num = Integer.parseInt(map.get("qna_about_num").toString());
		System.out.println(map.get("qna_about_num").toString());
		String qna_reply_id = map.get("qna_reply_id").toString();
		String qna_reply_content = map.get("qna_reply_content").toString();
		
		QnaReplyDTO to = new QnaReplyDTO(-1, qna_about_num, qna_reply_id, qna_reply_content, null, null);
		
		qrService.insert(to);
		return"입력완료되었습니다.";
	}

	// list.GET
	@RequestMapping(value = "/reply/{qna_about_num}", method = RequestMethod.GET)
	public List<QnaReplyDTO> list(@PathVariable("qna_about_num") int qna_about_num) {
		System.out.println("list");
		return qrService.list(qna_about_num);
	}

	// update.PUT
	@RequestMapping(value = "/reply", method = RequestMethod.PUT)
	public void update(@RequestBody Map<String,Object> map) {
		System.out.println("update:"+map);
		
		int qna_reply_num = Integer.parseInt(map.get("qna_reply_num").toString());
		System.out.println(qna_reply_num);
		String qna_reply_id = map.get("qna_reply_id").toString();
		System.out.println(qna_reply_id);
		String qna_reply_content = map.get("qna_reply_content").toString();
		System.out.println(qna_reply_content);
		
		QnaReplyDTO dto = new QnaReplyDTO(qna_reply_num, 0, qna_reply_id, qna_reply_content, null, null);
		qrService.update(dto);
	}

	// delete.GET
	@RequestMapping(value = "/reply", method = RequestMethod.DELETE)
	public void delete(@RequestBody Map<String,Object>map) {
		int qna_reply_num = Integer.parseInt(map.get("qna_reply_num").toString());
		qrService.delete(qna_reply_num);
	}

}