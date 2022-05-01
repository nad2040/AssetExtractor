package com.nad2040.assetextractor;

import java.io.File;
import java.util.LinkedHashMap;
import java.util.Set;

public class Assets {
    public static class FileInfo {
        public String hash;
        public int size;
    };

    public LinkedHashMap<String, FileInfo> objects;

    public Set<String> getKeys() {
        return objects.keySet();
    }
    public FileInfo get(String name) {
        return objects.get(name);
    }
}
