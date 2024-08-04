package com.java.service;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AbandonedServiceImpl implements AbandonedService {

    @Override
    public int getFilteredTotalCount(String uprCd, String orgCd) throws Exception {
        String xmlData = getPublicData(1, 1, uprCd, orgCd);
        Document doc = parseXmlDocument(xmlData);
        NodeList totalCountList = doc.getElementsByTagName("totalCount");
        if (totalCountList.getLength() > 0) {
            return Integer.parseInt(totalCountList.item(0).getTextContent());
        }
        return 0;
    }

    @Override
    public List<Map<String, String>> getAnimalListByPage(int page, int pageSize, String uprCd, String orgCd) throws Exception {
        String xmlData = getPublicData(page, pageSize, uprCd, orgCd);
        return parseXmlData(xmlData);
    }

    @Override
    public List<Map<String, String>> getSidoList() throws Exception {
        String xmlData = getSidoData();
        return parseSidoData(xmlData);
    }

    @Override
    public List<Map<String, String>> getSigunguList(String uprCd) throws Exception {
        String xmlData = getSigunguData(uprCd);
        return parseSigunguData(xmlData);
    }

    private String getPublicData(int page, int pageSize, String uprCd, String orgCd) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=zCTjzW18rqhX1LpK9QLM07rDQFLFiMXBd9EfNSbXHrHvcwrHSjT6qCb22u6iMlD%2B5W%2Bx%2FUu4Y0BcNSJ%2FrGmDTw%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageSize), "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"));

        if (uprCd != null) {
            urlBuilder.append("&" + URLEncoder.encode("upr_cd", "UTF-8") + "=" + URLEncoder.encode(uprCd, "UTF-8"));
        }
        if (orgCd != null) {
            urlBuilder.append("&" + URLEncoder.encode("org_cd", "UTF-8") + "=" + URLEncoder.encode(orgCd, "UTF-8"));
        }

        return getResponseFromUrl(urlBuilder.toString());
    }

    private List<Map<String, String>> parseXmlData(String xmlData) throws Exception {
        Document doc = parseXmlDocument(xmlData);
        NodeList itemList = doc.getElementsByTagName("item");
        List<Map<String, String>> animalList = new ArrayList<>();

        for (int i = 0; i < itemList.getLength(); i++) {
            Element item = (Element) itemList.item(i);
            Map<String, String> animalMap = new HashMap<>();

            animalMap.put("desertionNo", getElementValue(item, "desertionNo"));
            animalMap.put("kindCd", getElementValue(item, "kindCd"));
            animalMap.put("colorCd", getElementValue(item, "colorCd"));
            animalMap.put("age", getElementValue(item, "age"));
            animalMap.put("weight", getElementValue(item, "weight"));
            animalMap.put("processState", getElementValue(item, "processState"));
            animalMap.put("sexCd", getElementValue(item, "sexCd"));
            animalMap.put("neuterYn", getElementValue(item, "neuterYn"));
            animalMap.put("specialMark", getElementValue(item, "specialMark"));
            animalMap.put("careNm", getElementValue(item, "careNm"));
            animalMap.put("careTel", getElementValue(item, "careTel"));
            animalMap.put("popfile", getElementValue(item, "popfile"));

            animalList.add(animalMap);
        }

        return animalList;
    }

    private Document parseXmlDocument(String xmlData) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        return builder.parse(new org.xml.sax.InputSource(new StringReader(xmlData)));
    }

    private String getElementValue(Element parent, String elementName) {
        NodeList nodeList = parent.getElementsByTagName(elementName);
        if (nodeList.getLength() > 0) {
            return nodeList.item(0).getTextContent();
        }
        return "";
    }

    private String getSidoData() throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sido");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=zCTjzW18rqhX1LpK9QLM07rDQFLFiMXBd9EfNSbXHrHvcwrHSjT6qCb22u6iMlD%2B5W%2Bx%2FUu4Y0BcNSJ%2FrGmDTw%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=100");

        return getResponseFromUrl(urlBuilder.toString());
    }

    private List<Map<String, String>> parseSidoData(String xmlData) throws Exception {
        Document doc = parseXmlDocument(xmlData);
        NodeList itemList = doc.getElementsByTagName("item");
        List<Map<String, String>> sidoList = new ArrayList<>();

        for (int i = 0; i < itemList.getLength(); i++) {
            Element item = (Element) itemList.item(i);
            Map<String, String> sidoMap = new HashMap<>();

            sidoMap.put("orgCd", getElementValue(item, "orgCd"));
            sidoMap.put("orgdownNm", getElementValue(item, "orgdownNm"));

            sidoList.add(sidoMap);
        }

        return sidoList;
    }

    private String getSigunguData(String uprCd) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sigungu");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=zCTjzW18rqhX1LpK9QLM07rDQFLFiMXBd9EfNSbXHrHvcwrHSjT6qCb22u6iMlD%2B5W%2Bx%2FUu4Y0BcNSJ%2FrGmDTw%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("upr_cd", "UTF-8") + "=" + URLEncoder.encode(uprCd, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=100");

        return getResponseFromUrl(urlBuilder.toString());
    }

    private List<Map<String, String>> parseSigunguData(String xmlData) throws Exception {
        Document doc = parseXmlDocument(xmlData);
        NodeList itemList = doc.getElementsByTagName("item");
        List<Map<String, String>> sigunguList = new ArrayList<>();

        for (int i = 0; i < itemList.getLength(); i++) {
            Element item = (Element) itemList.item(i);
            Map<String, String> sigunguMap = new HashMap<>();

            sigunguMap.put("uprCd", getElementValue(item, "uprCd"));
            sigunguMap.put("orgCd", getElementValue(item, "orgCd"));
            sigunguMap.put("orgdownNm", getElementValue(item, "orgdownNm"));

            sigunguList.add(sigunguMap);
        }

        return sigunguList;
    }

    private String getResponseFromUrl(String urlString) throws Exception {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            byte[] bytes = conn.getInputStream().readAllBytes();
            String response = new String(bytes);
            conn.disconnect();
            return response;
        } else {
            conn.disconnect();
            throw new Exception("Error: " + conn.getResponseMessage());
        }
    }
}