package com.bitcamp.comm;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import com.bitcamp.dto.SponDTO;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

public class JexcelWriter {
	private static JexcelWriter jx = new JexcelWriter();
	private JexcelWriter() {
		super();
	}
	public static JexcelWriter getInstance() {
		return jx;
	}

	//파일이름 반환
	public String createExl(List<SponDTO> list, int i, String path) {
		// TODO Auto-generated method stub
		String filename = path + "\\temp"+i+".xls";
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("en", "EN"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(filename), ws);
			WritableSheet s = workbook.createSheet("SponData", 0);
			writeDataSheet(s, list);
			workbook.write();
			workbook.close();
		}catch(IOException e) {
			System.out.println(e);
		} catch (WriteException e) {
			System.out.println(e);
		}
		return filename;
	}
	
	private void writeDataSheet(WritableSheet s, List<SponDTO> list) throws WriteException{
		// TODO Auto-generated method stub
		WritableFont wf = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
		WritableCellFormat cf = new WritableCellFormat(wf);
		cf.setWrap(true);
		
		//게시글 번호
		Label l = new Label(0, 0, "게시글 번호", cf);
		s.addCell(l);
		WritableCellFormat cf1 = new WritableCellFormat(NumberFormats.INTEGER);
		for(int i=0; i<list.size(); i++) {
			Number n = new Number(0, i+1, list.get(i).getBoardno(), cf1);
			s.addCell(n);
		}
		
		//작성자
		l = new Label(1, 0, "작성자", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Label writer = new Label(1, i+1, list.get(i).getBoardwriter());
			s.addCell(writer);
		}
		
		//제목
		l = new Label(2, 0, "제목", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Label title = new Label(2, i+1, list.get(i).getBoardtitle());
			s.addCell(title);
		}
		
		//내용
		l = new Label(3, 0, "내용", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Label content = new Label(3, i+1, list.get(i).getBoardcontent());
			s.addCell(content);
		}
		
		//태그
		l = new Label(4, 0, "태그", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Label tag = new Label(4, i+1, list.get(i).getBoardtag());
			s.addCell(tag);
		}
		
		//목표 금액
		l = new Label(5, 0, "목표금액", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Number n = new Number(5, i+1, list.get(i).getDestmoney(), cf1);
			s.addCell(n);
		}
		
		//최소 후훵 금액
		l = new Label(6, 0, "최소 후원 금액", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Number n = new Number(6, i+1, list.get(i).getMinmoney(), cf1);
			s.addCell(n);
		}
		
		//마강일
		l = new Label(7, 0, "마감일", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Label finaldate = new Label(7, i+1, list.get(i).getFinaldate());
			s.addCell(finaldate);
		}
		
		//현재 모금액
		l = new Label(8, 0, "현재 모금액", cf);
		s.addCell(l);
		for(int i=0; i<list.size(); i++) {
			Number n = new Number(8, i+1, list.get(i).getNowmoney(), cf1);
			s.addCell(n);
		}
	}
	public int deleteExl(String exlname) {
		// TODO Auto-generated method stub
		return 0;
	}

}
