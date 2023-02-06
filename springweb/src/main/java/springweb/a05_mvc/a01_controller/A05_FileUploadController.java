package springweb.a05_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class A05_FileUploadController {
	// http://localhost:7080/springweb/uploadFrm.do
	@GetMapping("/uploadFrm.do")
	public String uploadFrm() {
		return "WEB-INF\\views\\a05_mvc\\a10_fileUpload.jsp";
	}
	@PostMapping("/upload.do")
	public String upload(@RequestParam("report") MultipartFile report) {
		System.out.println("서버까지 온 파일:"+report.getOriginalFilename());
		return "WEB-INF\\views\\a05_mvc\\a10_fileUpload.jsp";
	}
}
