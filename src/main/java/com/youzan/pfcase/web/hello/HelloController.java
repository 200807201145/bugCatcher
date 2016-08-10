package com.youzan.pfcase.web.hello;

import javax.inject.Inject;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.AccountService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HelloController {

//	@Inject
//	protected AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) throws Exception {
//		Account account = accountService.getAccount("admin");
//		model.addAttribute("message", account.getPassword());

		try {
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Account account = userDetails.getAccount();
			model.addAttribute("message", account.getEmail());
		} catch (Exception e) {
			model.addAttribute("message", "please log in.");
		}

		return "hello";
	}
}