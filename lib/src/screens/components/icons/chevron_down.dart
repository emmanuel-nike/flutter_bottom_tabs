import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String svgString = '''
<svg width="14" height="8" viewBox="0 0 14 8" fill="none" xmlns="http://www.w3.org/2000/svg">
  <g filter="url(#filter0_d_1_1024)">
    <path d="M12 0.999979L7 6.33331L2 0.999979" stroke="#CBC9FF" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" shape-rendering="crispEdges"/>
  </g>
  <defs>
    <filter id="filter0_d_1_1024" x="0.95" y="0.249969" width="12.1" height="7.43334" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
    <feFlood flood-opacity="0" result="BackgroundImageFix"/>
    <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
    <feOffset dy="0.3"/>
    <feGaussianBlur stdDeviation="0.15"/>
    <feComposite in2="hardAlpha" operator="out"/>
    <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.5 0"/>
    <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_1_1024"/>
    <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_1_1024" result="shape"/>
    </filter>
  </defs>
</svg>
''';

class ChevronDownIcon extends StatelessWidget {
  const ChevronDownIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      svgString,
      width: 15,
      height: 10,
      fit: BoxFit.fill,
    );
  }
}
