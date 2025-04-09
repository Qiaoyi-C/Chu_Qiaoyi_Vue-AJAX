<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Console;

class ConsoleController extends Controller
{
    /**
     * 取得所有主機資料（含特色）
     */
    public function getAll() {
        try {
            // 修改為 with('features') 以載入 features 關聯
            $consoles = Console::with('features')
                ->select('id', 'name', 'image_url', 'release_year')
                ->orderBy('release_year')
                ->get();
            
            return response()->json($consoles);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch consoles: ' . $e->getMessage()], 500);
        }
    }

    /**
     * 取得單一主機及其所有特色
     */
    public function getOne($id) {
        try {
            // 使用 features 關聯來載入特色
            $console = Console::with('features')->findOrFail($id);
            return response()->json($console);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['error' => 'Console not found'], 404);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch console: ' . $e->getMessage()], 500);
        }
    }

    /**
     * 新增主機
     */
    public function save(Request $request) {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'release_year' => 'required|numeric',
            'image_url' => 'required|url'
        ]);

        try {
            // 只接受需要的欄位
            $console = Console::create($request->only(['name', 'release_year', 'image_url']));
            return response()->json($console, 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create console: ' . $e->getMessage()], 500);
        }
    }

    /**
     * 更新主機
     */
    public function update(Request $request, $id) {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'release_year' => 'required|numeric',
            'image_url' => 'required|url'
        ]);

        try {
            $console = Console::findOrFail($id);
            $console->update($request->only(['name', 'release_year', 'image_url']));
            return response()->json($console);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['error' => 'Console not found'], 404);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update console: ' . $e->getMessage()], 500);
        }
    }

    /**
     * 刪除主機
     */
    public function delete($id) {
        try {
            $console = Console::findOrFail($id);
            $console->delete();
            return response()->json(null, 204);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['error' => 'Console not found'], 404);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete console: ' . $e->getMessage()], 500);
        }
    }
}
