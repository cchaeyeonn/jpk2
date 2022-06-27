package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	@GetMapping("/")//get방식 요청 처리
	public String home1() {
		return "home";
	}
	
	@GetMapping("/home.do")//get방식 요청 처리
	public String home2() {
		return "home";
	}
	
	@GetMapping("/fileUpload.do")//get방식 요청 처리
	public String fileUpload() {
		return "gallery/fileUpload";
	}
	
	/* Spring MVC에서 파일 업로드 구현을 위한 조치들
	 * 
	 * 1. pom.xml에 fileupload에 필요한 dependency 추가
	 * <dependency>
	 * 	<groupId>commons-fileupload</groupId>
	 * 	<artifactId>commons-fileupload</artifactId>
	 * 	<version>1.4</version>
	 * </dependency>
	 * 
	 * 2. pom.xml에 servlet-api와 jsp-api 업데이트
	 * <dependency>
	 * 	<groupId>javax.servlet</groupId>
	 * 	<artifactId>javax.servlet-api</artifactId>
	 * 	<version>3.1.0</version>
	 * 	<scope>provided</scope>
	 * </dependency>
	 * 
	 * <dependency>
	 * 	<groupId>javax.servlet.jsp</groupId>
	 * 	<artifactId>javax.servlet.jsp-api</artifactId>
	 * 	<version>2.3.2-b02</version>
	 * 	<scope>provided</scope>
	 * </dependency>
	 * 
	 * 3. servlet-context.xml에 MultipartResolver 빈 등록
	 * <beans:bean id="multipartResolver" 
	 *             class="org.springframework.web.multipart.support.StandardServletMultipartResolver">
	 * </beans:bean>
	 * 
	 * 4. web.xml에 <servlet>태그 내에 multipart-config 설정 정보 추가
	 * <multipart-config>
	 * 	<max-file-size>10485760</max-file-size><!-- 파일 한 개의 최대 크기: 10MB(10*1024*1024) -->
	 * 	<max-request-size>52428800</max-request-size><!-- 한 번에 여러 파일을 올릴 때 최대 크기: 50MB -->
	 * 	<file-size-threshold>20971520</file-size-threshold><!-- 넘으면 temp에 넣고 업로드에 들어가지 않음: 20MB -->
	 * </multipart-config>
	 * 
	 * 5. webapp/resources/upload 폴더 만들기
	 */
	
	
	@PostMapping("/fileUploadProcess.do")
	public String fileUploadProcess(@RequestParam("uploadFile") MultipartFile uploadFile,
			String content, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		//<input type ="file" name="uploadFile" />에서 업로드된 파일객체를 MultipartFile uploadFile에 저장
		
		//업로드된 파일을 프로젝트 내의 upload 폴더에 저장하기 전에 DB의 upload_file 테이블에 저장할 
		//origin_filename과 system_filename 값을 세팅함
		
		String origin_fileName = uploadFile.getOriginalFilename();
		
		//시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
		int dot_idx = origin_fileName.lastIndexOf(".");
		String fileName1 = origin_fileName.substring(0, dot_idx);
		String extension = origin_fileName.substring(dot_idx+1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String system_fileName = fileName2+"."+extension;
		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		//지정된 경로에 파일 저장
		//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
		String fullPath = realPath+system_fileName;
		uploadFile.transferTo(new File(fullPath));
		
		
		//파일업로드가 정상적으로 이루어진 것을 gallery_home.jsp에서 확인
		//model객체에 입력내용(content)와 system_fileName을 추가함
		//model.addAttribute("content", content);
		//model.addAttribute("fileName", system_fileName);
		
		//파일 업로드 디렉토리에 저장된 모든 파일이름을 가져와서 model객체에 추가
		/*File[] files = new File(realPath).listFiles();
		String[] fileNames = new String[files.length];
		
		for(int i=0; i<files.length; i++) {
			fileNames[i] = files[i].getName();
		}*/
		
		String[] fileNames = new File(realPath).list();
		model.addAttribute("fileNames", fileNames);
		
		
		return "gallery/gallery_home";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
