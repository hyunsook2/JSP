package m2board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.PagingUtil;



public class ListController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("접속 완료");
      // TODO Auto-generated method stub
      MBoardDAO dao = new MBoardDAO();
      //변수 저장
      Map<String, Object> map = new HashMap<>();
      
      //검색
      String searchType = req.getParameter("searchType");
      String searchStr = req.getParameter("searchStr");
      System.out.println(searchType+"|||"+searchStr);
      if(searchStr != null) {
         System.out.println("맵에 등록 완");
         map.put("searchType", searchType);
         map.put("searchStr", searchStr);
      }
      //전체 게시물 갯수
      int totalCount = dao.countAll(map);
      
      ServletContext application = getServletContext();
      int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
      int pageBlock= Integer.parseInt(application.getInitParameter("PAGING_BLOCK"));
      
      //페이지 확인
      int pageNum=1;
      String pageTemp=req.getParameter("pageNum");
      if(pageTemp!=null && !pageTemp.equals("")) {
         pageNum=Integer.parseInt(pageTemp);
      }
      
      //목록에서 보여줄 게시물 범위 계산
      int start=(pageNum-1)*pageSize+1;
      int end=pageNum*pageSize;
      map.put("start", start);
      map.put("end", end);
      //db에서 게시물 정보 읽기
      System.out.println("-----------");
      System.out.println(map.get("searchType")+"|||"+map.get("searchStr"));
      System.out.println("-----------");
      List<MBoardDTO> boardList=dao.getListPage(map);
      dao.close();
      //뷰에 값을 전달해 줄 것을 정리
      String pagingStr = PagingUtil.pagingBlock(totalCount, pageSize, pageBlock, pageNum, "../m2board/list.do");
      
      map.put("pagingStr", pagingStr);
      map.put("totalCount", totalCount);
      map.put("pageSize", pageSize);
      map.put("pageNum", pageNum);
      
      
      
      //뷰에 최종 전달
      req.setAttribute("boardList", boardList);
      req.setAttribute("map", map);
      req.getRequestDispatcher("/14M2Board/List.jsp").forward(req, resp);
      
      
      
   }

}