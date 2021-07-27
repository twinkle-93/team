package kr.co.controller.necessary;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.coupon.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Inject
	private CouponService cService;

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(Model model) {

	}

	// list.GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list() {

	}

	// list.POST
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public void list(Model model) {

	}

	// read.GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read() {

	}

	// read.POST
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public void read(Model model) {

	}

	// update.GET
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update() {

	}

	// update.POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(Model model) {

	}

	// delete.GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete() {

	}

	// delete.GET
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(Model model) {

	}

}
