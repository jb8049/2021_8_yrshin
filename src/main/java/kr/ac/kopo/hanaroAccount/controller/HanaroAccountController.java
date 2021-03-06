package kr.ac.kopo.hanaroAccount.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;
import kr.ac.kopo.hanaroAccount.vo.SplitKindInfoVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class HanaroAccountController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private HanaroAccountService hanaroAccService;
	

	
	//내 하나로 통장 조회
	@GetMapping("/hanaro/{userCode}")
	public ModelAndView hanaroAccount(@PathVariable("userCode") int userCode) {
		
		AccountVO hanaroInfo = hanaroAccService.selectHanaroInfo(userCode);
		/* HanaroVO hanaro = hanaroAccService.selectHanaroAcc(userCode); */
		
		ModelAndView mav = new ModelAndView("hanaro/hanaroAccount");
		
		mav.addObject("hanaroInfo", hanaroInfo);
		/* mav.addObject("hanaro", hanaro); */
		
		
		/*
		 * Map<AccountVO, HanaroVO> hanaroMap = new HashMap<AccountVO, HanaroVO>();
		 * 
		 * hanaroMap.put(hanaroInfo, hanaroAcc); System.out.println(hanaroMap);
		 * 
		 * mav.addObject("hanaroMap", hanaroMap);
		 * 
		 * System.out.println("value : " + hanaroMap.get(hanaroInfo));
		 * System.out.println("key : " + hanaroMap.keySet());
		 */
		return mav;
	}
	
	//ajax로 하나로 잔액 조회
	@ResponseBody
	@GetMapping("/hanaro/ajax/{userCode}")
	public HanaroVO hanaroBalance(@PathVariable("userCode") int userCode) {
		
		HanaroVO hanaro = hanaroAccService.selectHanaroAcc(userCode);
		System.out.println("ajax :  " + hanaro);

		return hanaro;
	}
	
	@GetMapping("/hanaro/selectJoin")
	public String selectJoin() {
		
		return "hanaro/selectJoin";
	}

	
	
	//통장전환 page 호출
	@GetMapping("/hanaro/changeToHanaro/{userCode}")
	public ModelAndView accountList(@PathVariable("userCode") int userCode)  {
		
			
		//List<AccountVO> accountList = accountServiceImpl.selectAll(userCode);
		List<AccountVO> accountList = accountService.selectAll(userCode);
		
		ModelAndView mav = new ModelAndView("hanaro/changeToHanaro");
		
		mav.addObject("accountList", accountList);
		
		return mav;
	}
	
	//전환할 통장 선택
	@PostMapping("/hanaro/changeToHanaro")
	public ModelAndView selectAccount(String accountNo) {
		
		System.out.println("account :" + accountNo);		
		AccountVO account = accountService.selectByAccNo(accountNo);
		
		ModelAndView mav = new ModelAndView("hanaro/termsOfService");
		mav.addObject("account", account);
		
		return mav;
	}
	
	//약관동의 후 통장전환 process 실행
	@PostMapping("/hanaro/termsOfService")
	public String changeToHanaro(String accountNo, int userCode) {
		
		System.out.println(accountNo);
		
		//	하나로 통장 전환 : (1. account type -> 하나로 통장	 	2.하나로 통장 table에 INSERT) 
		
		hanaroAccService.changeToHanaro(accountNo);
			
		//  3. 타입 바뀐 통장정보 불러오기
		return "redirect:/hanaro/" + userCode;
	}
	
	
	@ResponseBody
	@PostMapping("/hanaro/splitMoney")
	public void splitMoneyAjax(@RequestBody SplitHistoryVO splitHistory) {
		System.out.println(splitHistory);
		hanaroAccService.splitMoney(splitHistory);
//		hanaroAccService.splitMoney(splitInfo);
		System.out.println("컨트롤러");
		
	}
	
/*		
	// 잔액 변경 process실행
	//http://localhost:9998/Hana-Project/hanaro/splitMoney?splitFrom=basic&splitTo=consumption&transMoney=700
	@PostMapping("/hanaro/splitMoney/{userCode}")
	public String splitMoney(SplitInfoVO splitInfo, @PathVariable("userCode") int userCode) {
		System.out.println(splitInfo);
		
		hanaroAccService.splitMoney(splitInfo);
		
		 return "redirect:/hanaro/" + userCode; 
	}
*/	
	
	@GetMapping("/hanaro/detail/{splitKind}")
	public ModelAndView basicDetail(@PathVariable("splitKind") String splitKind, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		HanaroVO hanaro = hanaroAccService.selectHanaroAcc(userCode);
		
		System.out.println(splitKind);
		ModelAndView mav = new ModelAndView("hanaro/"+splitKind+"Detail");
		
		mav.addObject("hanaro",hanaro);
		String accountNo = hanaro.getAccountNo();
		
		splitKind = splitKind + "_balance";
		SplitKindInfoVO splitKindInfo = new SplitKindInfoVO(accountNo, splitKind);
		List<SplitHistoryVO> historyList = hanaroAccService.historyByKind(splitKindInfo);
		/*
		 * List<SplitHistoryVO> basicHistoryList = hanaroAccService.basicHistory(accountNo);
		 */		
		mav.addObject("historyList", historyList);
	//	System.out.println("컨트롤러!!! : " +historyList);
		
	//	System.out.println("디테일 컨트롤러");
		
		return mav;
	}
	
	//=======================대시보드 ? 하나로 ? ============================
	
	//내 월급 정보 가져오기
	@ResponseBody
	@PostMapping("/hanaro/getSalary")
	public HanaroVO getSalary(@RequestBody MemberVO member) {
		
		int userCode = member.getUserCode();
		System.out.println(userCode);
			
		HanaroVO hanaro = hanaroAccService.selectHanaroAcc(userCode);	
			System.out.println(hanaro);
		return hanaro;
	}
	
	//내 월급 정보 설정하기
	@ResponseBody
	@PostMapping("/hanaro/setSalary")
	public void setSalary(@RequestBody HanaroVO hanaro, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		hanaro.setAccountNo(accountNo);
		System.out.println("set!!"+hanaro);
		
		hanaroAccService.setSalary(hanaro);
		
	}
	
	
	
	//고정 출금, 고정 잔액이동 설정page
	

	
	
	
	
	/*
		@GetMapping("/hanaro/dashBoard")
		public String setFixedBudget() {
			/*
			 * List<FixedExpenseVO> list = fixedExpense(); 
			 * System.out.println(list);
			 
			
		//	List<FixedExpenseVO> list = fixedExpenseService.selectAll("081000000010");
			return "dashBoard/fixedBudget";
		}
*/
		/*
		@GetMapping("/hanaro/dashBoard/{userCode}")
		public ModelAndView setFixedBudget(@PathVariable("userCode") int userCode) {
			AccountVO account = hanaroAccService.selectHanaroInfo(userCode);
			String accountNo = account.getAccountNo();
			System.out.println(accountNo);
			
			List<FixedExpenseVO> fixedExpenseList = fixedExpenseService.selectAll(accountNo);
			ModelAndView mav = new ModelAndView("dashBoard/fixedBudget");
			mav.addObject("fixedExpenseList", fixedExpenseList);
			mav.addObject(accountNo);
			
			return mav;
		}
		
		
		@ResponseBody
		@PostMapping("/hanaro/fixedExpense")
		public List<FixedExpenseVO> fixedExpense(@RequestBody MemberVO loginMember){
			// System.out.println(userCode); 
			
			 // List<FixedExpenseVO> fixedExpenseList = fixedExpenseService.selectAll(accountNo);
			 
			
			AccountVO account = hanaroAccService.selectHanaroInfo(loginMember.getUserCode());
			String accountNo = account.getAccountNo();
			List<FixedExpenseVO> fixedExpenseList = fixedExpenseService.selectAll(accountNo);
			
			return fixedExpenseList;
		}
			
		@ResponseBody
		@PostMapping("/addFixedExpense")
		public void addFixedExpense(@RequestBody FixedExpenseVO fixedExpense) {
			System.out.println(fixedExpense);
			
			fixedExpenseService.insert(fixedExpense);
			
		}
		
		@ResponseBody
		@PostMapping("/deleteFixedExpense")
		public void deleteFixedExpense(@RequestBody FixedExpenseVO fixedExpense) {
			System.out.println(fixedExpense);
			
			int expenseCode = fixedExpense.getCode();
			fixedExpenseService.delete(expenseCode);
	
		}
		
		*/

	
}
