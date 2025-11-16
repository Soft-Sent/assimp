project "assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",
        "code/**.h",
        "code/**.hpp",
        "code/**.cpp",
        "code/**.c",

        "contrib/zlib/**.h",
        "contrib/zlib/**.c",
        
        "contrib/pugixml/src/**.hpp",
        "contrib/pugixml/src/**.cpp",
        
        "contrib/utf8cpp/source/**.h",
    }

    includedirs {
        ".", 
        "include",
        "code",
        "contrib",
        "contrib/zlib",
        "contrib/zlib/contrib/minizip",
        "contrib/pugixml/src",
        "contrib/utf8cpp/source",
        "%{IncludeDir.glm}"
    }

    defines {
        "ASSIMP_BUILD_NO_EXPORT",
        "ASSIMP_BUILD_NO_X_IMPORTER",
        "ASSIMP_BUILD_NO_3DS_EXPORT",
        "ASSIMP_BUILD_NO_VRML_IMPORTER",
        "ASSIMP_BUILD_NO_USD_IMPORTER",
        "ASSIMP_BUILD_NO_C4D_IMPORTER",
        "ASSIMP_BUILD_NO_IFC_IMPORTER",
        "ASSIMP_BUILD_NO_GLTF_IMPORTER",
        "ASSIMP_BUILD_NO_OPENGEX_IMPORTER"
    }

    removefiles {
        "contrib/zlib/contrib/inflate86/**.c"
    }

    filter "system:windows"
        systemversion "latest"

    filter "system:linux"
        pic "On"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "configurations:Distribution"
        runtime "Release"
        optimize "Full"
        symbols "Off"

