package utils;

public class PagingUtil {
	public static String pagingBlock(int totalCount, int pageSize, int blockSize, int pageNum, String reqUri) {
        String pagingRes = "";

        int totalPage = (int)Math.ceil((double)totalCount/pageSize);

        // [first] 1 2 3 4 5 [last]
        int startPage = Math.max(pageNum - blockSize / 2, 1);
        int endPage = Math.min(startPage + blockSize - 1, totalPage);

        if(startPage != 1) {
            pagingRes = "<a href='" + reqUri + "?pageNum=1'>[first]</a>";
            pagingRes += "&nbsp;&nbsp;...&nbsp;&nbsp;";
        }

        for(int i = startPage; i <= endPage; i++) {
            if(i == pageNum) {
                pagingRes += "&nbsp;" + i + "&nbsp;";
            } else {
                pagingRes += "&nbsp;<a href='" + reqUri + "?pageNum=" + i + "'>" + i + "</a>&nbsp;";
            }
        }

        if(endPage != totalPage) {
            pagingRes += "&nbsp;&nbsp;...&nbsp;&nbsp;";
            pagingRes += "<a href='" + reqUri + "?pageNum=" + totalPage + "'>[last]</a>";
        }

        return pagingRes;
    }
}