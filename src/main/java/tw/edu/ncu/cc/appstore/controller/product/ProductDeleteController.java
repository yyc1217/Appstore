package tw.edu.ncu.cc.appstore.controller.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import tw.edu.ncu.cc.appstore.entity.PersonType;
import tw.edu.ncu.cc.appstore.entity.Product;
import tw.edu.ncu.cc.appstore.entity.ProductState;
import tw.edu.ncu.cc.appstore.service.IProductStateService;
import tw.edu.ncu.cc.appstore.util.PersonInfo;
import tw.edu.ncu.cc.appstore.util.PersonUtil;

@Controller
@Scope("prototype")
public class ProductDeleteController extends ActionSupport{
    private static final long serialVersionUID = 1L;
    private IProductStateService<ProductState> serivce;
    @Inject
    public void setSerivce(IProductStateService<ProductState> serivce) {
        this.serivce = serivce;
    }
    private int id;
    private Product product;
    
    @Override
    public String execute(){
        System.out.println("aaaa");
        if(!PersonUtil.isLogined(ServletActionContext.getRequest())){            
            return LOGIN;
        }        
        System.out.println("bbbbb");
        System.out.println("xxx : "+id);
        if(id==0){            
            return INPUT;
        }        
        System.out.println("ccccc");
        if(isSameAuthor() || isAdmin()){
            System.out.println("ddddd");
            ProductState productState= serivce.find(ProductState.class, id);
            serivce.delete(productState);   
            System.out.println("eeee");
            return SUCCESS;
        }
        System.out.println("ffff");
        return ERROR;
    }
    
    private boolean isAdmin(){
        PersonInfo info=PersonUtil.getPersonInfo(ServletActionContext.getRequest());
        return info.getType().equals(PersonType.ADMIN.toString());
    }
    
    private boolean isSameAuthor(){
        ProductState productState= serivce.find(ProductState.class, id);
        if(productState!=null){
            List<Product> list =productState.getAllProducts();
            product=list.get(list.size()-1);
            PersonInfo info=PersonUtil.getPersonInfo(ServletActionContext.getRequest());
            if(product.getAuthor().getAccount().equals(info.getAccount())){                
                return true;
            }
        }       
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
}
