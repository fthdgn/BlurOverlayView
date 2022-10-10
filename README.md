# BlurOverlayView

A subclass of UIVisualEffectView with modifiable blur intensity. Blur intensity can be set by `intensity` property. Intensity can be between 0 and 1.

## Use with caution
Built-in UIVisualEffectView does not have any way to modify blur radius. There are many different hacks to solve this problem.   
This class uses animation pause hack to modify the blur intensity of built-in UIVisualEffectView. It may be broken on some cases, or on some iOS versions.
