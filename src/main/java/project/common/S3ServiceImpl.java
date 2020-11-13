package project.common;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

@Service("s3Service")
public class S3ServiceImpl implements S3Service{

    @Value("${s3.bucket}")
    private String bucket;

    @Autowired
    private AmazonS3 s3client;

    public void bucketUpload(String storedFileName, MultipartFile file){

        ObjectMetadata omd = new ObjectMetadata();
        omd.setContentType(file.getContentType());
        omd.setContentLength(file.getSize());
        omd.setHeader("filename",file.getOriginalFilename());

        try {
            s3client.putObject(new PutObjectRequest(bucket,storedFileName,file.getInputStream(),omd));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
