package project.common;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Component("fileUtils")
public class FileUtils {

	@Resource(name = "s3Service")
	private S3Service s3Service;

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public List<Map> saveFile(int index, List<MultipartFile> files, String requestPath) throws IOException {

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map> list = new ArrayList<Map>();
		Map listMap = null;

		for (MultipartFile m : files) {
			originalFileName = m.getOriginalFilename();
			originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;

			s3Service.bucketUpload(storedFileName,m);

			listMap = new HashMap();
			listMap.put("groupNum", index);
			listMap.put("originalFileName", originalFileName);
			listMap.put("storedFileName", storedFileName);
			listMap.put("fileSize", m.getSize());
			list.add(listMap);
		}
		return list;
	}

	public Map saveSingleFile(int index, MultipartFile fileP, String requestPath) throws IOException {

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		Map map = null;

		originalFileName = fileP.getOriginalFilename();
		originalFileExtension = fileP.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
		storedFileName = getRandomString() + originalFileExtension;

		s3Service.bucketUpload(storedFileName,fileP);

		map = new HashMap();
		map.put("userNum", index);
		map.put("originalFileName", originalFileName);
		map.put("storedFileName", storedFileName);
		map.put("fileSize", map.get("Size"));

		return map;
	}

	public List<Map> saveCommuAlbumFile(int index, List<MultipartFile> files, String requestPath) throws IOException {

	String originalFileName = null;
	String originalFileExtension = null;
	String storedFileName = null;

	List<Map> list = new ArrayList<Map>();
	Map listMap = null;

	for (MultipartFile m : files) {
		originalFileName = m.getOriginalFilename();
		originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
		storedFileName = getRandomString() + originalFileExtension;

		s3Service.bucketUpload(storedFileName,m);

		listMap = new HashMap();
		listMap.put("groupNum", index);
		listMap.put("originalFileName", originalFileName);
		listMap.put("storedFileName", storedFileName);
		listMap.put("fileSize", m.getSize());
		list.add(listMap);
	}
	return list;
	}
}

