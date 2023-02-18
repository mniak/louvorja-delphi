package sdl

import (
	"sync"

	"github.com/veandco/go-sdl2/sdl"
)

type syncSurface struct {
	mutex   sync.RWMutex
	surface *sdl.Surface
}

func (sfm *syncSurface) Replace(newSurf *sdl.Surface) {
	sfm.mutex.Lock()
	defer sfm.mutex.Unlock()

	if sfm.surface != nil {
		sfm.surface.Free()
	}
	sfm.surface = newSurf
}

func (sfm *syncSurface) UseLocked(fn func(surf *sdl.Surface) error) error {
	sfm.mutex.RLock()
	defer sfm.mutex.RUnlock()
	if sfm.surface == nil {
		return nil
	}
	return fn(sfm.surface)
}

type syncTexture struct {
	mutex   sync.RWMutex
	texture *sdl.Texture
}

func (sfm *syncTexture) Replace(newTexture *sdl.Texture) {
	sfm.mutex.Lock()
	defer sfm.mutex.Unlock()

	if sfm.texture != nil {
		sfm.texture.Destroy()
	}
	sfm.texture = newTexture
}

func (sfm *syncTexture) UseLocked(fn func(surf *sdl.Texture) error) error {
	sfm.mutex.RLock()
	defer sfm.mutex.RUnlock()
	if sfm.texture == nil {
		return nil
	}
	return fn(sfm.texture)
}
