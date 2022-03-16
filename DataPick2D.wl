(* ::Package:: *)

BeginPackage["DataPick2D`"]

DataPick2D::usage="DataPick2D[picture,result,absolute image size] returns the data of a colormap";
Begin["`Private`"]


SetAttributes[DataPick2D,HoldRest];
DataPick2D[pic_,resMarkers_,size_]:=Module[{},
img=ImageApply[#[[;;3]]&,pic];
DynamicModule[{pt={ImageDimensions[img]/4,ImageDimensions[img]/2},axisDefinePane,defineLegendPane,editMarkersPane,finalResultPane,
xAxisBegin,xAxisEnd,yAxisBegin,yAxisEnd,lengmarkers={ImageDimensions[img]/2},myMarkers={ImageDimensions[img]/2},myTransform,xoy={{1/2,1/8}*ImageDimensions[img],{1/8,1/8}*ImageDimensions[img],{1/8,1/2}*ImageDimensions[img]},list={},lens},
axisDefinePane=Grid[{{LocatorPane[Dynamic[xoy],Dynamic[Show[img,Graphics[{Line[xoy]}],ImageSize->size]],
Appearance->{Graphics[{Red,AbsolutePointSize[5],Point[{0,0}]}],Graphics[{Green,AbsolutePointSize[5],Point[{0,0}]}],Graphics[{Blue,AbsolutePointSize[5],Point[{0,0}]}]}]},
{Row[{"x(1): ",InputField[Dynamic[xAxisBegin],Number,FieldSize->Tiny]," x(2): ",InputField[Dynamic[xAxisEnd],Number,FieldSize->Tiny]}]},
{Row[{"y(1): ",InputField[Dynamic[yAxisBegin],Number,FieldSize->Tiny]," y(2): ",InputField[Dynamic[yAxisEnd],Number,FieldSize->Tiny]}]},{list={};Row[{"Lengend values: ",InputField[Dynamic[Null,AppendTo[list,#]&],Number,FieldSize->Tiny],Button["Reset",list={}] ,Button["Back",list=Drop[list,-1]]}]},{Dynamic[TableForm[{list},TableSpacing->{1, 1}]]}}];
defineLegendPane=LocatorPane[Dynamic[lengmarkers],Show[img,ImageSize->size],LocatorAutoCreate->True];
editMarkersPane=LocatorPane[Dynamic[myMarkers],Show[img,ImageSize->size],Appearance->Graphics[{Black,Circle[{0,0},1]},ImageSize->10],LocatorAutoCreate->True];
finalResultPane=Dynamic[Refresh[myTransform=FindGeometricTransform[{{xAxisEnd,yAxisBegin},{xAxisBegin,yAxisBegin},{xAxisBegin,yAxisEnd}},xoy][[2]]//Quiet;
Column@{ListLinePlot[(resMarkers={myTransform[#[[1]]],#[[2]]}&/@({#,ImageValue[img,#]}&/@Sort[myMarkers]);resMarkers[[;;,1]]),Frame->True,Mesh->All,ImageSize->ImageDimensions@img],lens=Transpose[{list,ImageValue[img,#]&/@lengmarkers}];funfit[pot_]:=MinimalBy[lens,EuclideanDistance[pot,#[[2]]]&][[1]];TableForm[{RGBColor[ImageValue[img,#]]&/@lengmarkers}],TableForm[Flatten/@(resMarkers=Flatten[{#[[1]],funfit[#[[2]]][[1]]}]&/@resMarkers),TableHeadings->{None,{"x","y","value"}}]},TrackedSymbols:>{lengmarkers,myMarkers,xoy,xAxisEnd,xAxisBegin,yAxisBegin,yAxisEnd}],TrackedSymbols:>{lengmarkers,myMarkers,xoy,xAxisEnd,xAxisBegin,yAxisBegin,yAxisEnd}];
TabView[{"Define axes"->axisDefinePane,"Define Lengends"->defineLegendPane,"Edit Markers"->editMarkersPane,"Results"->finalResultPane}]]
]


(* ::Input:: *)
(**)


End[]
EndPackage[]
