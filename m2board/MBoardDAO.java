package m2board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.BoardDTO;
import common.JDBConnPool;

public class MBoardDAO extends JDBConnPool {
   public MBoardDAO() {
      super();
   }
   
   
   public int countAll(Map<String, Object> map) {
      int totalCount=0;
      
      System.out.println();
      System.out.println(map.get("searchType")+"|||"+map.get("searchStr"));
      
      String zz="select count(*) from FILEBOARD";
         if(map.get("searchStr")!=null) {
            zz += " where "+map.get("searchType")+" like '%"+map.get("searchStr")+"%'";
         }
         System.out.println(zz);
         try {
            psmt=con.prepareStatement(zz);
            rs=psmt.executeQuery();
            rs.next();
            totalCount=rs.getInt(1);
         } catch (Exception e) {
            System.out.println("게시물 카운트 중 에러");
            e.printStackTrace();
         }
      return totalCount;
   }
   
   public List<MBoardDTO> getListPage(Map<String, Object> map){
      List<MBoardDTO> bl = new Vector<>();
      
      String zz = "select * from (select rownum pnum, s.* from(select b.* from FILEBOARD b ";
         if(map.get("searchStr")!=null) {
            zz += " where "+map.get("searchType")+" like '%"+map.get("searchStr")+"%'";
         }
         
         zz+=" order by idx desc) s) where pnum between ? and ?";
         
         System.out.println(zz);
         
         try {
            psmt = con.prepareStatement(zz);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs= psmt.executeQuery();
            
            while(rs.next()) {
               MBoardDTO dto = new MBoardDTO();
               dto.setIdx((rs.getString("idx")));
               dto.setName(rs.getString("name"));
               dto.setTitle(rs.getString("title"));
               dto.setContent(rs.getString("content"));
               dto.setPostdate(rs.getDate("postdate"));
               dto.setOfile(rs.getString("ofile"));
               dto.setNfile(rs.getString("nfile"));
               dto.setDowncount(rs.getInt("downcount"));
               dto.setVisitcount(rs.getInt("visitcount"));
               dto.setPass(rs.getString("pass"));
               
               bl.add(dto);
            }
            
         } catch (SQLException e) {
            e.printStackTrace();
         }
      return bl;
   }
   public int insertWrite(MBoardDTO dto) {
		int result=0;
		String zz="insert into fileboard(idx,name,title,content,ofile,nfile,pass)"
				+ "values(seq_board_num.nextval,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(zz);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getPass());
			result=psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}
   public void updateVisitCount(String idx) {
	   String zz="update fileboard set visitcount=visitcount+1 "+" where idx=?";
	   try {
		   psmt=con.prepareStatement(zz);
		   psmt.setString(1, idx);
		   psmt.executeUpdate();
	   }catch(Exception e) {
		   System.out.println("조회수 증가 중 예외");
		   e.printStackTrace();
	   }
   }

   public MBoardDTO getView(String idx) {
	      MBoardDTO dto = new MBoardDTO();

	      String zz = "SELECT * FROM fileboard b WHERE idx=?";
	      try {
	         psmt = con.prepareStatement(zz);
	         psmt.setString(1, idx);
	         rs = psmt.executeQuery();
	         if (rs.next()) {
	            dto.setIdx(rs.getString("idx"));
	            dto.setName(rs.getString("name"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setPostdate(rs.getDate("postdate"));
	            dto.setOfile(rs.getString("ofile"));
	            dto.setNfile(rs.getString("nfile"));
	            dto.setDowncount(rs.getInt("downcount"));
	            dto.setVisitcount(rs.getInt("visitcount"));
	            dto.setPass(rs.getString("pass"));
	         }
	      } catch (Exception e) {
	    	  System.out.println("상세보기 중 예외");
	         e.printStackTrace();
	      }
	      return dto;
	   }


	public void updateDowncount(String idx) {
		String zz="update fileboard set downcount=downcount+1 "+" where idx=?";
		try {
			psmt=con.prepareStatement(zz);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("다운로드 수 증가 중 예외");
			e.printStackTrace();
		}
	}


	public int getDowncount(String idx) {
		int dcount=0;
		String zz = "select downcount from fileboard where idx=?";
		try {
			psmt=con.prepareStatement(zz);
			psmt.setString(1, idx);
			rs=psmt.executeQuery();
			rs.next();
			dcount=rs.getInt(1);
		}catch (Exception e) {
			System.out.println("다운로드 수 읽기 중 에러");
			e.printStackTrace();
		}
		return dcount;
	}
	public boolean confirmPassword(String pass, String idx) {
		boolean isRight=false;
		try {
			String zz="SELECT COUNT(*) FROM FILEBOARD WHERE PASS=? AND IDX=?";
			psmt=con.prepareStatement(zz);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==1) {
				isRight=true;
			}
		}catch(Exception e) {
			isRight=false;
			System.out.println("암호 검증 중 에러");
			e.printStackTrace();
		}
		return isRight;
	}
	public int deletePost(String idx) {
		int result=0;
		try {
			String zz="delete from fileboard where idx=?";
			psmt=con.prepareStatement(zz);
			psmt.setString(1, idx);
			result=psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("삭제중에러");
			e.printStackTrace();
		}
		return result;
	}


	public int updatePost(MBoardDTO dto) {
		int result=0;
		try {
			String zz="update fileboard set title=?, name=? ,content=?, ofile=?, nfile=? where idx=? and pass=?";
			psmt=con.prepareStatement(zz);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			result=psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 수정중 에러");
			e.printStackTrace();
		}
		return result;
	}
}