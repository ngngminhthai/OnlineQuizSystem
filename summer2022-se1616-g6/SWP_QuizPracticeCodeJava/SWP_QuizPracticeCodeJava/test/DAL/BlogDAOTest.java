
package DAL;

import Models.Blog;
import java.util.ArrayList;
import java.util.Arrays;
import org.junit.Test;
import static org.junit.Assert.*;

public class BlogDAOTest {
    
    BlogDAO bdao = new BlogDAO();
   
    @Test
    public void testGetBlogsOrderByDate() {
        ArrayList<Blog> list = bdao.getAllBlogsByDate();
        int sizeRs = list.size();
        int sizeExpected = 5;
        assertEquals(sizeExpected, sizeRs);
    }
    
    @Test
    public void testGetAllBlogsByDatePaging1() {
        ArrayList<Blog> list = bdao.getAllBlogsByDatePaging(1, 3);
        int sizeRs = list.size();
        int sizeExpected = 3;
        assertEquals(sizeExpected, sizeRs);
    }
    
    @Test
    public void testGetAllBlogsByDatePaging2() {
        ArrayList<Blog> list = bdao.getAllBlogsByDatePaging(2, 3);
        int sizeRs = list.size();
        int sizeExpected = 2;
        assertEquals(sizeExpected, sizeRs);
    }
    
    @Test
    public void testGetAllBlogsByDatePaging3() {
        ArrayList<Blog> list = bdao.getAllBlogsByDatePaging(3, 3);
        int sizeRs = list.size();
        int sizeExpected = 0;
        assertEquals(sizeExpected, sizeRs);
    }

    @Test
    public void testGetBlogByCateID1() {
        ArrayList<Blog> list = bdao.getBlogByCateID(1);
        ArrayList<Integer> blogIdRs = new ArrayList<>() ;
        for (Blog b : list) {
            blogIdRs.add(b.getBlogId());
        }
        Object[] rs = blogIdRs.toArray();
        Object[] expected = {1,2};
        assertArrayEquals(expected, rs);
    }
    
    @Test
    public void testGetBlogByCateID2() {
        ArrayList<Blog> list = bdao.getBlogByCateID(2);
        ArrayList<Integer> blogIdRs = new ArrayList<>() ;
        for (Blog b : list) {
            blogIdRs.add(b.getBlogId());
        }
        Object[] rs = blogIdRs.toArray();
        Object[] expected = {3};
        assertArrayEquals(expected, rs);
    }
    
     @Test
    public void testGetBlogByCateID3() {
        ArrayList<Blog> list = bdao.getBlogByCateID(3);
        ArrayList<Integer> blogIdRs = new ArrayList<>() ;
        for (Blog b : list) {
            blogIdRs.add(b.getBlogId());
        }
        Object[] rs = blogIdRs.toArray();
        Object[] expected = {4};
        assertArrayEquals(expected, rs);
    }
    
    @Test
    public void testGetBlogByCateID4() {
        ArrayList<Blog> list = bdao.getBlogByCateID(5);
        ArrayList<Integer> blogIdRs = new ArrayList<>() ;
        for (Blog b : list) {
            blogIdRs.add(b.getBlogId());
        }
        Object[] rs = blogIdRs.toArray();
        Object[] expected = {5};
        assertArrayEquals(expected, rs);
    }

    @Test
    public void testGetTotalBlogs() {
        int sizeRs = bdao.getTotalBlogs();
        int sizeExpected = 5;
        assertEquals(sizeExpected, sizeRs);
    }
    
    @Test
    public void testGetBlogByBlogID1() {
        Blog b = bdao.getBlogByBlogID(1);
        String rs = b.getBlogTitle();
        String expect = "Rita’s Way: Why is it so Effective?";
        assertEquals(expect, rs);
    }
    
    @Test
    public void testGetBlogByBlogID2() {
        Blog b = bdao.getBlogByBlogID(2);
        String rs = b.getBlogTitle();
        String expect = "Write Useful Comments";
        assertEquals(expect, rs);
    }
    
    @Test
    public void testGetBlogByBlogID3() {
        Blog b = bdao.getBlogByBlogID(3);
        String rs = b.getBlogTitle();
        String expect = "Decision Making: Going Forward in Reverse";
        assertEquals(expect, rs);
    }
    
    @Test
    public void testGetBlogByBlogID4() {
        Blog b = bdao.getBlogByBlogID(4);
        String rs = b.getBlogTitle();
        String expect = "What is Agile?";
        assertEquals(expect, rs);
    }
    
    @Test
    public void testGetBlogByBlogID5() {
        Blog b = bdao.getBlogByBlogID(5);
        String rs = b.getBlogTitle();
        String expect = "Why is it important to learn English?";
        assertEquals(expect, rs);
    }

    @Test
    public void testGetBlogCateName() {
    ArrayList<Blog> list = bdao.getBlogCateName();
        int rs = list.size();
        int expected = 5;
        assertEquals(expected, rs);
    }
    
    @Test
    public void testGetBlogAndAuthor() {
        ArrayList<Blog> list = bdao.getBlogAndAuthor();
        int rs = list.size();
        int expected = 5;
        assertEquals(expected, rs);
    }

    @Test
    public void testSearchBlogTitle1() {
        ArrayList<Blog> list = bdao.searchBlogTitle("useful");
        int rs = list.size();
        int expected = 1;
        assertEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle2() {
        ArrayList<Blog> list = bdao.searchBlogTitle("eng");
        int rs = list.size();
        int expected = 1;
        assertEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle3() {
        ArrayList<Blog> list = bdao.searchBlogTitle("way");
        int rs = list.size();
        int expected = 1;
        assertEquals(expected, rs);
    }

    @Test
    public void testSearchBlogTitle4() {
        ArrayList<Blog> list = bdao.searchBlogTitle("Rita");
        int rs = list.size();
        int expected = 1;
        assertEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle5() {
        ArrayList<Blog> list = bdao.searchBlogTitle("Agile");
        int rs = list.size();
        int expected = 1;
        assertEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle6() {
        ArrayList<Blog> list = bdao.searchBlogTitle("comment");
        ArrayList<String> nameRs = new ArrayList<>();
        for (Blog b : list) {
            nameRs.add(b.getBlogTitle());
        }
        Object[] rs = nameRs.toArray();
        Object[] expected = {"Write Useful Comments"};
        assertArrayEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle7() {
        ArrayList<Blog> list = bdao.searchBlogTitle("use");
        ArrayList<String> nameRs = new ArrayList<>();
        for (Blog b : list) {
            nameRs.add(b.getBlogTitle());
        }
        Object[] rs = nameRs.toArray();
        Object[] expected = {"Write Useful Comments"};
        assertArrayEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle8() {
        ArrayList<Blog> list = bdao.searchBlogTitle("Write");
        ArrayList<String> nameRs = new ArrayList<>();
        for (Blog b : list) {
            nameRs.add(b.getBlogTitle());
        }
        Object[] rs = nameRs.toArray();
        Object[] expected = {"Write Useful Comments"};
        assertArrayEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle9() {
        ArrayList<Blog> list = bdao.searchBlogTitle("im");
        ArrayList<String> nameRs = new ArrayList<>();
        for (Blog b : list) {
            nameRs.add(b.getBlogTitle());
        }
        Object[] rs = nameRs.toArray();
        Object[] expected = {"Why is it important to learn English?"};
        assertArrayEquals(expected, rs);
    }
    
    @Test
    public void testSearchBlogTitle10() {
        ArrayList<Blog> list = bdao.searchBlogTitle("learn");
        ArrayList<String> nameRs = new ArrayList<>();
        for (Blog b : list) {
            nameRs.add(b.getBlogTitle());
        }
        Object[] rs = nameRs.toArray();
        Object[] expected = {"Why is it important to learn English?"};
        assertArrayEquals(expected, rs);
    }
}
