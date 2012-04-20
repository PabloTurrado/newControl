
ADD_DEFINITIONS(-DFREEGLUT_STATIC -D_CRT_SECURE_NO_WARNINGS)
ADD_EXECUTABLE(	teleop
		teleop.cpp
		glutapp.cpp
		PathControl/Control.cpp 
		PathControl/Angular.cpp
		PathControl/AngDistToSeg.cpp 
		PathControl/CalculoError.cpp
		PathControl/ADSK.cpp
		ReactiveControl/Vision2D.cpp
		ReactiveControl/ControlReactivo.cpp
		)

IF(WIN32)
	TARGET_LINK_LIBRARIES(teleop debug mrcore_d freeglut_static)
	TARGET_LINK_LIBRARIES(teleop optimized mrcore freeglut_static)
ELSE(WIN32) #LINUX	
	TARGET_LINK_LIBRARIES(teleop mrcore glut GL GLU )
ENDIF(WIN32)
		
##################################
##   INSTALL MY APPS
##################################
INSTALL(TARGETS teleop DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)



