package com.project.foodiefoodie.util;

import com.google.cloud.vision.v1.*;
import com.google.protobuf.ByteString;
import lombok.extern.log4j.Log4j2;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Log4j2
public class OCRUtils {

    // Detects text in the specified image.
    private static String detectText(String filePath) {
        List<AnnotateImageRequest> requests = new ArrayList<>();
        ByteString imgBytes ;

        try {
            imgBytes = ByteString.readFrom(new FileInputStream(filePath));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Image img = Image.newBuilder().setContent(imgBytes).build();
        Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
        AnnotateImageRequest request =
                AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
        requests.add(request);

        try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
            BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
            List<AnnotateImageResponse> responses = response.getResponsesList();
            return responses.get(0).getTextAnnotationsList().get(0).getDescription();
        } catch (Exception e) {
            log.info("detectText - {} ", e.getMessage());
            return null;
        }
    }

    public static String recognizeReceipt(String filePath) {
        String result = detectText(filePath);
        if (result != null) {
            List<String> splitResult = List.of(result.split("\n"));
            if (result.contains("취소")) {
                return null;
            }
            if (result.contains("승인번호") || result.contains("승인 번호") || result.contains("승인NO")) {
                return result;
            }
        }
        return result;
    }
}
