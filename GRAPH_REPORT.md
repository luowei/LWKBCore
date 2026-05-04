# Graph Report - /Users/luowei/projects/libs/LWKBCore  (2026-05-04)

## Corpus Check
- Corpus is ~7,195 words - fits in a single context window. You may not need a graph.

## Summary
- 69 nodes · 51 edges · 7 communities detected
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]

## God Nodes (most connected - your core abstractions)
1. `KeyboardType` - 12 edges
2. `LWAppDelegate` - 8 edges
3. `LWKBConfig` - 7 edges
4. `Tests` - 5 edges
5. `LWViewController` - 4 edges
6. `WordEngineSettings` - 4 edges
7. `WordEngineSettingsView` - 3 edges
8. `KeyboardTypeOptions` - 3 edges
9. `WordEngineResource` - 2 edges
10. `WordEngineSettingsView_Previews` - 2 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Communities (19 total, 1 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.15
Nodes (8): WordEngineResource, WordEngineResourceRegistry, WordEngineSettings, WordEngineSettingsView, WordEngineSettingsView_Previews, ObservableObject, PreviewProvider, View

### Community 1 - "Community 1"
Cohesion: 0.17
Nodes (12): CaseIterable, KeyboardType, biHuaNine, enFull, handWriting, numNine, pingYinFull, pingYinNine (+4 more)

### Community 2 - "Community 2"
Cohesion: 0.22
Nodes (7): LWAppDelegate, -applicationDidBecomeActive, -applicationDidEnterBackground, -applicationdidFinishLaunchingWithOptions, -applicationWillEnterForeground, -applicationWillResignActive, -applicationWillTerminate

### Community 3 - "Community 3"
Cohesion: 0.25
Nodes (3): LWKBConfig, -hellowrold, NSObject

### Community 4 - "Community 4"
Cohesion: 0.33
Nodes (4): Tests, -setUp, -tearDown, -testExample

### Community 5 - "Community 5"
Cohesion: 0.4
Nodes (3): LWViewController, -didReceiveMemoryWarning, -viewDidLoad

## Knowledge Gaps
- **22 isolated node(s):** `-applicationdidFinishLaunchingWithOptions`, `-applicationWillResignActive`, `-applicationDidEnterBackground`, `-applicationWillEnterForeground`, `-applicationDidBecomeActive` (+17 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `KeyboardType` connect `Community 1` to `Community 6`?**
  _High betweenness centrality (0.043) - this node is a cross-community bridge._
- **What connects `-applicationdidFinishLaunchingWithOptions`, `-applicationWillResignActive`, `-applicationDidEnterBackground` to the rest of the system?**
  _22 weakly-connected nodes found - possible documentation gaps or missing edges._