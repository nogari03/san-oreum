package project.common;

import org.springframework.web.multipart.MultipartFile;

public interface S3Service {
    void bucketUpload(String keyName, MultipartFile file);
}
