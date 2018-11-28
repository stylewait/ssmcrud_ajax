import com.chen.crud.bean.Department;
import com.chen.crud.bean.Employee;
import com.chen.crud.dao.DepartmentMapper;
import com.chen.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 测试dao层的工作
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    /**
     * 测试DepartmentMapper
     */
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {

       // 1、创建SpringIoC容器
       //ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        // 2、从容器中获取mapper
        //DepartmentMapper departmentMapper = ac.getBean(DepartmentMapper.class);

        //1、插入几个部门
        //departmentMapper.insertSelective(new Department(null, "人事部"));
        //departmentMapper.insertSelective(new Department(null, "研发部"));
        /* = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = */
        //2、生成员工数据，测试员工插入
        //EmployeeMapper employeeMapper = ac.getBean(EmployeeMapper.class);
        //employeeMapper.insertSelective(new Employee(null, "jerry", "M", "jerry@qq.com", 1));
        /* = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = */
        //3、批量插入多个员工；批量，使用可以执行批量操作的sqlSession

        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++){
            String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uuid, "M", uuid + "@qq.com", 1));
        }
        System.out.println("批量插入完成！");

    }
}
