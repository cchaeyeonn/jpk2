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
	
	@GetMapping("/")//get諛⑹떇 �슂泥� 泥섎━
	public String index1() {
		return "index";
	}
	
	@GetMapping("/index.do")//get諛⑹떇 �슂泥� 泥섎━
	public String index2() {
		return "index";
	}
	
	@GetMapping("/fileUpload.do")//get諛⑹떇 �슂泥� 泥섎━
	public String fileUpload() {
		return "gallery/fileUpload";
	}
	
	/* Spring MVC�뿉�꽌 �뙆�씪 �뾽濡쒕뱶 援ы쁽�쓣 �쐞�븳 議곗튂�뱾
	 * 
	 * 1. pom.xml�뿉 fileupload�뿉 �븘�슂�븳 dependency 異붽�
	 * <dependency>
	 * 	<groupId>commons-fileupload</groupId>
	 * 	<artifactId>commons-fileupload</artifactId>
	 * 	<version>1.4</version>
	 * </dependency>
	 * 
	 * 2. pom.xml�뿉 servlet-api�� jsp-api �뾽�뜲�씠�듃
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
	 * 3. servlet-context.xml�뿉 MultipartResolver 鍮� �벑濡�
	 * <beans:bean id="multipartResolver" 
	 *             class="org.springframework.web.multipart.support.StandardServletMultipartResolver">
	 * </beans:bean>
	 * 
	 * 4. web.xml�뿉 <servlet>�깭洹� �궡�뿉 multipart-config �꽕�젙 �젙蹂� 異붽�
	 * <multipart-config>
	 * 	<max-file-size>10485760</max-file-size><!-- �뙆�씪 �븳 媛쒖쓽 理쒕� �겕湲�: 10MB(10*1024*1024) -->
	 * 	<max-request-size>52428800</max-request-size><!-- �븳 踰덉뿉 �뿬�윭 �뙆�씪�쓣 �삱由� �븣 理쒕� �겕湲�: 50MB -->
	 * 	<file-size-threshold>20971520</file-size-threshold><!-- �꽆�쑝硫� temp�뿉 �꽔怨� �뾽濡쒕뱶�뿉 �뱾�뼱媛�吏� �븡�쓬: 20MB -->
	 * </multipart-config>
	 * 
	 * 5. webapp/resources/upload �뤃�뜑 留뚮뱾湲�
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
